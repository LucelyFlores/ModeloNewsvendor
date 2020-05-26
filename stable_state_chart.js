/*
 * Function that allows me to validate that the information has been entered,
 * in case it is, it will be sent to the server.
 */
const validate_information = () => {
    /* I get the values from the inputs. */
    let meand, sd, p, c;
    meand = document.getElementById('meand').value;
    meand_result = parseInt(meand);
    sd = document.getElementById('sd').value;
    sd_result = parseInt(sd);
    p = parseInt(document.getElementById('p').value);
    p_length = document.getElementById('p').value.length;
    c_length = document.getElementById('c').value.length;
    c = parseInt(document.getElementById('c').value);
    /* Validation */
    if (meand.length > 0 && sd.length > 0 && p_length > 0 && c_length > 0) {
        /* I save everything in a JSON that i will send to the server. */
        let json = {
            meand: meand_result,
            sd: sd_result,
            p: p,
            c: c
        }
        /* I send the information to Shiny. */
        Shiny.onInputChange("click", json);
    } else {
        /* I send an alert that there are missing fields to fill out. */
        alert("There are fields without being completed, complete the fields to continue.");
    }
}

/*
 * Function that allows me to generate the graph of the
 * probabilities of "n" users in the system.
 */
const generate_stable_state_chart = (info) => {
    /*  Generation of the chart. */
    let ctx = document.getElementById('stable_state_chart').getContext('2d');
   /* let stable_state_chart = new Chart(ctx, {
     * type: 'bar',
     * data: {
       *   labels: ['p0', 'p1', 'p2'],
        * datasets: [{
          *  label: 'The probability (p0, p1, ..., pk) are:',
           *   data: [info[0][0], info[0][1], info[0][2]],
          *      backgroundColor: [
           *         'rgba(255, 99, 132, 0.2)',
            *        'rgba(54, 162, 235, 0.2)',
             *       'rgba(255, 206, 86, 0.2)'
              *  ],
               * borderColor: [
                *    'rgba(255, 99, 132, 1)',
                 *   'rgba(54, 162, 235, 1)',
                  *  'rgba(255, 206, 86, 1)'
            *    ],
             *   borderWidth: 1
        *    }]
    *    },
     *   options: {
      *      scales: {
       *         yAxes: [{
        *            ticks: {
         *               beginAtZero: true
          *          }
           *     }]
          *  }
    *    }
*    });
*/
    /* Generation of the statistical report. */
    /* I show the hidden paragraphs and then i print the information. */
    let p_length = document.getElementsByTagName("p").length;
    for (let i = 0; i < p_length; i++) {
        document.getElementsByTagName("p")[i].style.visibility = "visible";
    }
    document.getElementById('optimal order up quentity').innerHTML = info[0];
    document.getElementById('safety stock').innerHTML = info[1];
    document.getElementById('expected cost').innerHTML = info[2];
    document.getElementById('expected profit').innerHTML = info[3];
    document.getElementById('coefficient of variation of the demand').innerHTML = info[4];
    document.getElementById('fill rate').innerHTML = info[5];
    document.getElementById('safety factor').innerHTML = info[6];
    /*document.getElementById('mean-time-spend-server').innerHTML = info[8];
    *document.getElementById('mean-time-spend-queue-where-queue').innerHTML = info[9];
    *document.getElementById('throughput').innerHTML = info[10];
    */
}
